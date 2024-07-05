function Sortarray(arr) {
    return arr.sort(function (a, b) {
        // แยก prefix และ number ออกจาก string
        var regex = /(\D+)(\d+)/;
        var _a = a.match(regex) || [], aPrefix = _a[1], aNumber = _a[2];
        var _b = b.match(regex) || [], bPrefix = _b[1], bNumber = _b[2];
        // ถ้า prefix เหมือนกัน เปรียบเทียบตัวเลข
        if (aPrefix === bPrefix) {
            return parseInt(aNumber) - parseInt(bNumber);
        }
        // ถ้า prefix ต่างกัน เรียงตามตัวอักษร
        return aPrefix.localeCompare(bPrefix);
    });
}
//ex1
var arr1 = ["TH19", "SG20", "TH2"];
var sortedArr1 = Sortarray(arr1);
console.log(sortedArr1); // ["SG20", "TH2", "TH19"]
//ex2
var arr2 = ["THh10", "TH3Netflix", "TH1", "TH7"];
var sortedArr2 = Sortarray(arr2);
console.log(sortedArr2); // ["TH1", "TH3Netflix", "TH7", "TH10"]
