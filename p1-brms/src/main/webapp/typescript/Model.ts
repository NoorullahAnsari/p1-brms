interface ATM{

    deposit(money :number) : number;
    withdrawal() : string;
}
class CanaraBank implements ATM{
    balance : number;
    set Balance(newBalance : number){
        this.balance = newBalance;
    }
    get Balance(){
        return this.balance;
    }
    
    deposit(money: number) : number{
        return (this.balance + money);
        
    }
    withdrawal(): string {
        return "Withdrawal successfull!";
        
    }
}

let obj = <CanaraBank>{};
obj.Balance =5000;
obj.deposit(1000);
console.log(obj.deposit);
console.log(obj.withdrawal);


