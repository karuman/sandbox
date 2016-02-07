export class Item {
  id: number;
  name: string;
  type: string;
  description:string;

  constructor(id,name,type,description){
    this.id=id;
    this.name=name;
    this.type=type;
    this.description=description;
  }
}
