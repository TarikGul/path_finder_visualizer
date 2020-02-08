class Tile {
    constructor(x, y, color, classAttr){
        this.position = [x, y];
        this.color = color;
        this.class = classAttr;
    }
}

const t = new Tile(4, 5, 'red', 'wall')
console.log(t)
