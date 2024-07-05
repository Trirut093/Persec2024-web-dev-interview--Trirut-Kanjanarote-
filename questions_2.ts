function Sortarray(arr: string[]): string[] {
    return arr.sort((a, b) => {
      // แยก prefix และ number ออกจาก string
      const regex = /(\D+)(\d+)/;
      const [, aPrefix, aNumber] = a.match(regex) || [];
      const [, bPrefix, bNumber] = b.match(regex) || [];
  
      
      // ถ้า prefix เหมือนกัน เปรียบเทียบตัวเลข
      if (aPrefix === bPrefix) {
        return parseInt(aNumber) - parseInt(bNumber);
      }
      // ถ้า prefix ต่างกัน เรียงตามตัวอักษร
      return aPrefix.localeCompare(bPrefix);
    });
  }
  //ex1
 const arr1 = ["TH19", "SG20", "TH2"];
const sortedArr1 = Sortarray(arr1);
console.log(sortedArr1); // ["SG20", "TH2", "TH19"]
//ex2
const arr2 = ["THh10", "TH3Netflix", "TH1", "TH7"];
const sortedArr2 = Sortarray(arr2);
console.log(sortedArr2); // ["TH1", "TH3Netflix", "TH7", "TH10"]

  