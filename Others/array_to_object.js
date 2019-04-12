var result = [  { name : 'riyad'} ,  {name: 'ahsan'}];


console.log(result);



var abc = {};


for(var i = 0 ; i<result.length; i++)
{
	abc[result[i].name] = result[i].name;
}


console.log(abc);

