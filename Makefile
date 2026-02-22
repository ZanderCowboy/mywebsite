.PHONY: r rebuild

r rebuild:
	dart run build_runner build --delete-conflicting-outputs
