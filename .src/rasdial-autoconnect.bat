@echo off

:start

ping -n 2 114.114.114.114 | find "TTL=" > nul

if errorlevel 1 (
    echo ���ߣ��ȴ�����...
    rasdial ������� test test
    TIMEOUT 10
) else (
    echo.
    echo �Ѿ������ϡ�
    goto :end
)

goto :start

:end
