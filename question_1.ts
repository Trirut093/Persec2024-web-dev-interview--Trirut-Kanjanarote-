function hexToRgb(hex: string) {
    hex = hex.replace(/^#/, '');

  
    if (hex.length === 3) {
        hex = hex.split('').map(char => char + char).join('');
    }

   
    if (hex.length !== 6) {
        return null;
    }

   
    const bigint = parseInt(hex, 16);

    // แยกสีแดง (r), เขียว (g), และน้ำเงิน (b) จาก bigint โดยใช้ bitwise operations
    const r = (bigint >> 16) & 255;
    const g = (bigint >> 8) & 255;
    const b = bigint & 255;

    return { r, g, b };
}

//ex1
console.log(hexToRgb('#1A237E'));
// Output: { r: 26, g: 35, b: 126 }

//ex2
console.log(hexToRgb('#ff9933'));
// Output: { r: 255, g: 153, b: 51 }
