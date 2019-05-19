const objectMeIfEmpty = item => (item && item.constructor && item.constructor === Object) ? item : {};
// When optional chaining lands:
//const objectMeIfEmpty = item => (item?.constructor === Object) ? item : {};