#!/bin/bash

echo "=========================================="
echo "  Deploying My Store to Firebase Hosting"
echo "=========================================="
echo ""

# Check if Firebase CLI is installed
if ! command -v firebase &> /dev/null; then
    echo "[ERROR] Firebase CLI not found!"
    echo ""
    echo "Please install it first:"
    echo "npm install -g firebase-tools"
    echo ""
    exit 1
fi

echo "[1/4] Logging in to Firebase..."
firebase login

echo ""
echo "[2/4] Initializing project..."
firebase init hosting --project my-store-bf8a3

echo ""
echo "[3/4] Copying files to public folder..."
mkdir -p public
cp index.html public/
cp -r css public/
cp -r js public/
cp -r admin public/
cp manifest.json public/
cp firebase-messaging-sw.js public/

echo ""
echo "[4/4] Deploying to Firebase..."
firebase deploy --only hosting

echo ""
echo "=========================================="
echo "  Deployment Complete!"
echo "  Your site: https://my-store-bf8a3.web.app"
echo "=========================================="
