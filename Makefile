.PHONY: sync-container
sync-container:
	@echo "Syncing container..."
	@./bin/rsync_host_to_container.sh -t themes
