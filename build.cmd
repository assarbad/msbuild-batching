@echo off
set MSBuildDebugEngine=1
set MSBUILDDEBUGPATH=%~dp0msbuild-batching.dbg
set MSBUILDTARGETOUTPUTLOGGING=1
set MSBUILDLOGTASKINPUTS=1
set MSBUILDDISABLENODEREUSE=1
set MSBUILDDEBUGSCHEDULER=1
msbuild -p:Configuration=Release -t:Rebuild -verbosity:diagnostic
