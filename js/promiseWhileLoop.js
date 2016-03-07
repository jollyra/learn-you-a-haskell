function doSomeWork() {
  return new Promise(function (resolve, reject) {
    console.log('hello');
    i--;
    resolve();
  });
}

function promiseWhile(condition, action) {
  return new Promise(function (resolve, reject) {
    if (!condition()) {
      console.log('done');
      resolve();
    } else {
      console.log('going to do some work');
      action().then(function (workOutput) {
        resolve(promiseWhile(condition, action));
      });
    }
  });
}

var i = 10;
var isNotZero = function () {
  return i >= 0;
}
promiseWhile(isNotZero, doSomeWork);
