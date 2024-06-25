# flutter_template

### Clone Flutter Template

```sh
git clone https://github.com/gopalkatariya44/flutter_template.git
```

### Change the App Name and Bundle Id in project

```sh
flutter pub get
```

```sh
flutter pub global activate rename
```

```sh
rename getAppName --targets ios,android
```

```sh
rename setAppName --targets ios,android --value "appname"
```

```sh
rename getBundleId --targets ios,android
```

```sh
rename setBundleId --targets ios,android --value "com.example.appname"
```
