var db = require('./db');



module.exports = {
	confirmOrder: function(orderInfo  , callback){

		console.log('order model');

		var sql = "call order_t("+orderInfo.uid+" , '"+orderInfo.order_date+"' , '"+orderInfo.payment_method+"');";

		db.getResult(sql, callback);

		console.log(sql);

	}
}