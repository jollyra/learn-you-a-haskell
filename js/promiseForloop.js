function doSomeWork(name, i) {
  return new Promise(function (resolve, reject) {
    console.log(`I'm ${name} #${i}`)
    resolve(name);
  })
}

function promiseForLoop(someInput, times) {
  return new Promise(function (resolve, reject) {
    if (times === 0) {
      resolve(someInput);
    } else {
      doSomeWork(someInput, times - 1).then(function (workOutput) {
        resolve(promiseForLoop(workOutput, times - 1));
      });
    }
  });
}

promiseForLoop("nigel", 10);
