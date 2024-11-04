## Mock app(Flutter app)

### Step to start Flutter app
- [run app] `flutter run`
- [run app in chrome with disable -web-security] `flutter run -d chrome --web-browser-flag "--disable-web-security"`

### Generate Mock component using Mockito for test class 
`dart run build_runner build`

### Unit test
`flutter test --tags unit`

### widget test
`flutter test --tags widget`

### Goldens test(snapshot)
`flutter test --update-goldens --tags=golden` 

### Update Goldens Reference Image 
`flutter test --update-goldens`

### Troubleshooting
1. Error: cocopod not install or not invalid state. Solution [Intel one](https://stackoverflow.com/questions/62593939/cocoapods-not-installed-or-not-in-valid-state), [ARM one](https://stackoverflow.com/questions/64901180/how-to-run-cocoapods-on-apple-silicon-m1)
2. iOS simulator can connect using http://localhost:3000
But android emulator cannot. Android emulator need to use actual IP address or 10.0.2.2 otherwise error will be throw from flutter code.


## Node.js server1
### Step to start Node.js server1
1. navigate to server1's location. Given now terminal is at root project folder
`cd api/server1`
2. pull server dependency
`npm install`
3. start server
`node app.js`
4. verify server health by running `app.consumer.http`. Need to install vscode extension, [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) first.
5. Run e2e testing
`npx jest app.test.js`

Note: To run specific describe in test file, `npx jest app.test.js -t {describe name}`

## Node.js server2
### Step to start Node.js server2
1. navigate to server2's location. Given now terminal is at root project folder
`cd api/server2`
2. pull server dependency
`npm install`
3. start server
`node app.js`
4. verify server health by running `app.consumer.http`. Need to install vscode extension, [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) first.
5. Run e2e testing
`npx jest app.test.js`





## E2E testing (FE-BE)

### Steps to run E2E test using flutter framework
1. Require server1 running
`cd api/server1`
`node app.js`
2. Running integration test 
`flutter test integration_test/app_test.dart`

