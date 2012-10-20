# LocaleSetter Test Application

This application exists to be a black-box test harness for the `LocaleSetter` gem (https://github.com/jcasimir/locale_setter). It exercises the four happy-paths of locale determination.

## Running the Specs

First, install dependencies:

```
bundle
```

Then prepare the database:

```
rake db:setup
```

Then execute the specs:

```
rake
```

All specs should pass.