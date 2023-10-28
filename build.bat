@echo off

if "%1%"=="prune" goto prune
if "%1%"=="all" goto all
if "%1%"=="backend" goto backend
if "%1%"=="nginx" goto nginx
if "%1%"=="frontend" goto frontend
if "%1%"=="upload" goto upload

echo.
echo Options: prune, all, backend, nginx, frontend, upload
echo.
goto exit0

:prune
echo.
echo Prune all images
echo.
docker image prune -a
docker images
goto exit0

:all
echo.
echo Build all images
echo.
docker-compose build backend nginx frontend
goto exit0

:backend
echo.
echo Build image: eztest-backend
echo.
docker-compose build backend
goto exit0

:nginx
echo.
echo Build image: eztest-nginx
echo.
docker-compose build nginx
goto exit0

:frontend
echo.
echo Build image: eztest-frontend
echo.
docker-compose build frontend
goto exit0

:upload
echo.
echo Upload images to Docker Hub
echo.
if "%2%"=="all" goto uAll
if "%2%"=="backend" goto uBackend
if "%2%"=="nginx" goto uNginx
if "%2%"=="frontend" goto uFrontend
echo.
echo Options: upload all/backend/nginx/frontend
echo.
goto exit0

:uAll
echo.
echo Upload all images
echo.
docker login
docker tag eztest-backend hoang12345/eztest-backend
docker push hoang12345/eztest-backend
pause
docker tag eztest-nginx hoang12345/eztest-nginx
docker push hoang12345/eztest-nginx
pause
docker tag eztest-frontend hoang12345/eztest-frontend
docker push hoang12345/eztest-frontend
goto exit0

:uBackend
echo.
echo Upload eztest-backend
echo.
docker login
docker tag eztest-backend hoang12345/eztest-backend
docker push hoang12345/eztest-backend
goto exit0

:uNginx
echo.
echo Upload eztest-nginx
echo.
docker login
docker tag eztest-nginx hoang12345/eztest-nginx
docker push hoang12345/eztest-nginx
goto exit0

:uFrontend
echo.
echo Upload eztest-frontend
echo.
docker login
docker tag eztest-frontend hoang12345/eztest-frontend
docker push hoang12345/eztest-frontend
goto exit0

:exit0
rem Done!
exit /b 0
pause