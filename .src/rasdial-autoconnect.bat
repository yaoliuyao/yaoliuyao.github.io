@echo off

:start

ping -n 2 114.114.114.114 | find "TTL=" > nul

if errorlevel 1 (
    echo 离线，等待连接...
    rasdial 宽带连接 test test
    TIMEOUT 10
) else (
    echo.
    echo 已经连接上。
    goto :end
)

goto :start

:end
