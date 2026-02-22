.PHONY: r rebuild mr

r rebuild mr:
	flutter pub run build_runner build --delete-conflicting-outputs
