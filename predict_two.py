import numpy as np
import pandas as pd
import gym
from gym import spaces
from stable_baselines3 import PPO
from stable_baselines3.common.env_util import make_vec_env
import datetime
import warnings
warnings.filterwarnings("ignore")

# Custom Gym Environment
class TimeSeriesEnv(gym.Env):
    def __init__(self, data, window_size=5, max_value=100.0):
        super(TimeSeriesEnv, self).__init__()
        self.data = data  # DataFrame with 'time' and 'value' columns
        self.window_size = window_size
        self.max_value = max_value  # Max value for action scaling
        self.current_step = window_size
        self.max_steps = len(data) - 1
        
        # State: last `window_size` values
        self.observation_space = spaces.Box(low=0, high=self.max_value, shape=(window_size,), dtype=np.float32)
        # Action: predicted value
        self.action_space = spaces.Box(low=0, high=self.max_value, shape=(1,), dtype=np.float32)
    
    def reset(self):
        self.current_step = self.window_size
        return self._get_state()
    
    def _get_state(self):
        # Return last `window_size` values
        return np.array(self.data['value'].iloc[self.current_step-self.window_size:self.current_step], dtype=np.float32)
    
    def step(self, action):
        # Action is the predicted value
        actual_value = self.data['value'].iloc[self.current_step]
        # Reward: negative absolute error (encourage accuracy)
        reward = -abs(actual_value - action[0])
        self.current_step += 1
        done = self.current_step >= self.max_steps
        next_state = self._get_state()
        info = {'actual': actual_value, 'predicted': action[0]}
        return next_state, reward, done, info

# Function to parse time (HH:MM:SS)
def parse_time(time_str):
    try:
        return datetime.datetime.strptime(time_str, "%H:%M:%S")
    except ValueError:
        raise ValueError("Time must be in HH:MM:SS format")

# Main function
def main():
    # Load initial data (replace with your CSV file)
    # Example format: time, value
    # 14:30:45, 5.67
    # 14:30:46, 6.12
    data = pd.DataFrame({
        'time': [f"14:30:{i:02d}" for i in range(200)],
        'value': np.random.uniform(0, 10, 200).round(2)  # Replace with actual data
    })
    
    # Validate data
    data['time'] = data['time'].apply(parse_time)
    data['value'] = data['value'].astype(float)
    assert (data['value'] >= 0).all(), "Values must be non-negative"
    
    # Initialize environment
    window_size = 5
    max_value = data['value'].max() * 2  # Allow predictions up to twice the max observed
    env = make_vec_env(lambda: TimeSeriesEnv(data, window_size, max_value), n_envs=1)
    
    # Initialize PPO model
    model = PPO("MlpPolicy", env, verbose=0, learning_rate=0.0003)
    
    # Train on initial data
    print("Training on historical data...")
    model.learn(total_timesteps=10000)
    print("Training complete.")
    
    # Real-time prediction loop
    print("\nEnter new values (format: HH:MM:SS, X.XX) or 'quit' to exit.")
    current_data = data.tail(window_size).copy()
    obs = np.array(current_data['value'].values, dtype=np.float32)
    
    while True:
        # Get user input
        user_input = input("Enter time and value (e.g., 14:30:50, 5.67) or 'quit': ")
        if user_input.lower() == 'quit':
            break
        
        try:
            time_str, value_str = user_input.split(',')
            time = parse_time(time_str.strip())
            value = float(value_str.strip())
            if value < 0:
                print("Value must be non-negative.")
                continue
        except (ValueError, AttributeError):
            print("Invalid format. Use HH:MM:SS, X.XX (e.g., 14:30:50, 5.67).")
            continue
        
        # Update data
        new_row = pd.DataFrame({'time': [time], 'value': [value]})
        current_data = pd.concat([current_data, new_row], ignore_index=True)
        current_data = current_data.tail(window_size)  # Keep only last `window_size` rows
        
        # Get current prediction
        action, _ = model.predict(obs, deterministic=True)
        predicted_value = action[0]
        
        # Calculate error
        error = value - predicted_value
        print(f"Actual: {value:.2f}, Predicted: {predicted_value:.2f}, Error: {error:.2f}")
        
        # Update environment for training
        temp_env = TimeSeriesEnv(current_data, window_size, max_value)
        temp_env.current_step = window_size
        _, reward, _, info = temp_env.step([predicted_value])
        
        # Train model with new data
        model.learn(total_timesteps=100, reset_num_timesteps=False)
        
        # Update observation for next prediction
        obs = np.array(current_data['value'].values, dtype=np.float32)
        
        # Predict next value
        action, _ = model.predict(obs, deterministic=True)
        next_predicted_value = action[0]
        print(f"Next predicted value: {next_predicted_value:.2f}\n")
    
    print("Exiting program.")

if __name__ == "__main__":
    main()