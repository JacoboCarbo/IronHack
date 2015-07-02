'use strict';

var ShoppingCart = function (){
	this.cart = new Array();
};

	ShoppingCart.prototype.addItem = function (item) {
		this.cart.push(item)
		console.log("------------------------------------------");
		console.log(item.name + " +1"+"\t—> ||");
	}

	ShoppingCart.prototype.removeItem = function (item, amount) {
		var deleted = 0;
		this.cart = this.cart.filter (function (cartItem){
			if(cartItem.name === item && deleted<amount){
				deleted++;
				return false;
			}else{
				return true;
			}
		});
		if(deleted>0){
		console.log("------------------------------------------");
		console.log("\t\t   || —> -"+deleted+ " "+ item+"s");
		}
	}

	ShoppingCart.prototype.total = function () {
		var total=0;
		var apples = 0;
		var oranges = 0;
		this.cart.forEach( function (item){
			total+= item.price;
			if (item.name === "apple"){
				apples++;
			}
			else if(item.name === "orange"){
				oranges++;
			}
		});

		total -= this.discountApples(apples);
		total -= this.discountOranges(oranges);
		total -= this.discount10(total);
		console.log("\n\n— — — — — — — — — — — — — — — — — — — — —");
		console.log("    ||  Your total is €" + total+"  ||");	
		console.log("— — — — — — — — — — — — — — — — — — — — —\n\n");
	}

	ShoppingCart.prototype.discount10 = function (total) {
		if (this.cart.length > 5){
			total *= 0.1;
		}
		return 0;
		
	}

	ShoppingCart.prototype.discountApples = function (apples) {
		var applePrice = 10;
		var discount = Math.floor(apples/2)*applePrice;
		return discount;
	}

	ShoppingCart.prototype.discountOranges = function (oranges) {
		var orangePrice = 5;
		var orangeDiscount = 0.5;
		var discount = 0;
		if(oranges>5){
			discount = (oranges-5)*orangePrice*orangeDiscount;
		}
		return discount;
	}


	

module.exports = ShoppingCart;




