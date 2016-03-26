export class Product {
  id: number;
  name: string;
  description: string;
  children : Product[];
  constructor(id: number, name:string,description: string,products:Product[]) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.children=products;
  }
}