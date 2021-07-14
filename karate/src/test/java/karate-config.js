function fn(){

  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'test'; // a custom 'intelligent' default
  }

  var config = { // base config JSON
    appId: 'my.app.id',
    appSecret: 'my.secret',
    host: 'https://petstore.swagger.io/',
  };

  if (env == 'test') {
    // over-ride only those that need to be
    config.host = 'https://petstore.swagger.io/';
  } else if (env == 'preprod') {
    config.host = 'https://petstore.swagger.io/';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;

  }
