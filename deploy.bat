
echo off
@REM echo ---
@REM {
@REM   "target": "mobile-computing",
@REM   "public": "hosting/slides-mobile-computing",
@REM   "ignore": [
@REM     "firebase.json",
@REM     "**/.*",
@REM     "**/node_modules/**"
@REM   ],
@REM   "rewrites": [
@REM     {
@REM       "source": "**",
@REM       "destination": "/index.html"
@REM     }
@REM   ]
@REM }
@REM firebase hosting:sites:create mobile-computing
@REM firebase target:apply hosting mobile-course mobile-computing
@REM firebase deploy --only hosting:mobile-computing
@REM firebase deploy --only hosting:mobile-computing
@REM firebase deploy --only hosting:mobile-course

@REM echo off
@REM echo ---
cd d:\edu\fall23\dlu
start firebase deploy --only hosting:mobile-course
@REM pause

@REM firebase hosting:sites:create 20CT4104
@REM firebase target:apply hosting 20CT4104 20CT4104
@REM firebase deploy --only hosting:20CT4104

@REM firebase hosting:sites:create 20CT4106
@REM firebase target:apply hosting 20CT4106 20CT4106
firebase deploy --only hosting:20CT4106

