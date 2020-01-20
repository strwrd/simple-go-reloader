PID = /tmp/app-process.pid
GO_FILES = $(wildcard *.go)

start:
	@go run $(GO_FILES) & echo $$! > $(PID)

stop:
	@-kill `pstree -p \`cat $(PID)\` | tr "\n" " " |sed "s/[^0-9]/ /g" |sed "s/\s\s*/ /g"` 2> /dev/null
  
reload: stop start
	@echo "===RELOADED==="
  
serve: start
	@-fswatch -or --event=Updated . | xargs -n1 -I {} make reload -s
  
.PHONY: start stop reload serve
