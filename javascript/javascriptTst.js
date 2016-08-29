var greeting = function(name) {
	return "Hello" + " " + name;
};

function square (number) {
	return number*number;
};

function greeting2 (name) {
	return "Hello" + " " + name;
};

function fibonacci (n) {
	if (n===1 || n===2) {
		return 1;
	}
	else {
		return fibonacci(n-1) + fibonacci(n-2);
	}
};

var compare = function(choice1, choice2) {
    if (choice1 === choice2) {
        return "The result is a tie!";
    }
};

debug(fibonacci(1));
debug(fibonacci(30));

var coinFace = Math.floor(Math.random() * 2);

while(coinFace === 0){
	debug("Heads! Flipping again...");
	var coinFace = Math.floor(Math.random() * 2);
}
debug("Tails! Done flipping.");

// debug(greeting("Gary"));
// debug(greeting2("Gary"));
// debug(square(13));