slate.configAll({
	"windowHintsDuration": 2,
	"gridBackgroundColor": "75;77;81;0.4",
	"switchOrientation": "vertical",
	"switchSelectedBorderSize": 0,
	"switchSelectedBackgroundColor": "50;53;58;0.7"
	// "windowHintsSpread": true
});

// var moveLeft = slate.operation("push", {
// 	"direction": "left",
// 	"style": "bar-resize:screenSizeX/2"
// });
var moveLeft = slate.operation("move", {
	"x": "screenOriginX",
	"y": "screenOriginY + 35",
	"width": "screenSizeX/2",
	"height": "screenSizeY-35"
});
slate.bind("a:alt;shift", function(win) {
	win.doOperation(moveLeft);
});


var moveRight = slate.operation("push", {
	"direction": "right",
	"style": "bar-resize:screenSizeX/2"
});
// var moveRight = slate.operation("move", {
// 	"x": "screenOriginX + screenSizeX/2",
// 	"y": "screenOriginY + 35",
// 	"width": "screenSizeX/2",
// 	"height": "screenSizeY - 35"
// });
slate.bind("d:alt;shift", function(win) {
	win.doOperation(moveRight);
});


var moveTopLeft = slate.operation("corner", {
	"direction": "top-left",
	"width": "screenSizeX/2",
	"height": "screenSizeY/2"
});
slate.bind("q:alt;shift", function(win) {
	win.doOperation(moveTopLeft);
});


var moveTopRight = moveTopLeft.dup({
	"direction": "top-right"
});
slate.bind("e:alt;shift", function(win) {
	win.doOperation(moveTopRight);
});


var moveBottomLeft = moveTopLeft.dup({
	"direction": "bottom-left"
});
slate.bind("z:alt;shift", function(win) {
	win.doOperation(moveBottomLeft);
});


var moveBottomRight = moveTopLeft.dup({
	"direction": "bottom-right"
});
slate.bind("c:alt;shift", function(win) {
	win.doOperation(moveBottomRight);
});


var pushUp = slate.operation("push", {
	"direction": "top",
	"style": "bar-resize:screenSizeY/2"
});
slate.bind("w:alt;shift", function(win) {
	win.doOperation(pushUp);
});


var pushDown = slate.operation("push", {
	"direction": "bottom",
	"style": "bar-resize:screenSizeY/2"
});
slate.bind("x:alt;shift", function(win) {
	win.doOperation(pushDown);
});


var smallWin = slate.operation("move", {
	"x": "screenOriginX + screenSizeX/6.9",
	"y": "screenOriginY + screenSizeY/10",
	"width": "screenSizeX * 0.7101449275",
	"height": "screenSizeY * 0.8"
});
slate.bind("s:alt;shift", function(win) {
	win.doOperation(smallWin);
});

// var fullscreen = slate.operation("move", {
// 	"x": "screenOriginX",
// 	"y" : "screenOriginY + 35",
//   	"width" : "screenSizeX",
//   	"height" : "screenSizeY - 35"
// });
var fullscreen = slate.operation("move", {
	"x": "screenOriginX",
	// "y" : "screenOriginY",
	"y": "screenOriginY + 35",
  	"width" : "screenSizeX",
  	"height" : "screenSizeY"
});
slate.bind("f:alt;shift", function(win) {
	win.doOperation(fullscreen);
});



var nudgeRight = slate.operation("nudge", {
	"x": "+10%",
	"y": "+0"
});
slate.bind("right:ctrl;alt;cmd", function(win) {
	win.doOperation(nudgeRight);
});


var nudgeLeft = slate.operation("nudge", {
	"x": "-10%",
	"y": "+0"
});
slate.bind("left:ctrl;alt;cmd", function(win) {
	win.doOperation(nudgeLeft);
});


var nudgeUp = slate.operation("nudge", {
	"x": "+0",
	"y": "-10%"
});
slate.bind("up:ctrl;alt;cmd", function(win) {
	win.doOperation(nudgeUp);
});


var nudgeDown = slate.operation("nudge", {
	"x": "+0",
	"y": "+10%"
});
slate.bind("down:ctrl;alt;cmd", function(win) {
	win.doOperation(nudgeDown);
});


var resizeTopPos = slate.operation("resize", {
	"width": "+0",
	"height": "+10%",
	"anchor": "bottom-right"
});
slate.bind("up:ctrl;alt", function(win) {
	win.doOperation(resizeTopPos);
});


var resizeBottomPos = slate.operation("resize", {
	"width": "+0",
	"height": "+10%"
});
slate.bind("down:alt;cmd", function(win) {
	win.doOperation(resizeBottomPos);
});


var resizeRightPos = slate.operation("resize", {
	"width": "+10%",
	"height": "+0"
});
slate.bind("right:alt;cmd", function(win) {
	win.doOperation(resizeRightPos);
});


var resizeLeftPos = slate.operation("resize", {
	"width": "+10%",
	"height": "+0",
	"anchor": "bottom-right"
});
slate.bind("left:ctrl;alt", function(win) {
	win.doOperation(resizeLeftPos);
});


var resizeTopNeg = slate.operation("resize", {
	"width": "+0",
	"height": "-10%",
	"anchor": "bottom-right"
});
slate.bind("down:ctrl;alt", function(win) {
	win.doOperation(resizeTopNeg);
});


var resizeBottomNeg = slate.operation("resize", {
	"width": "+0",
	"height": "-10%"
});
slate.bind("up:alt;cmd", function(win) {
	win.doOperation(resizeBottomNeg);
});

var resizeRightNeg = slate.operation("resize", {
	"width": "-10%",
	"height": "+0"
});
slate.bind("left:alt;cmd", function(win) {
	win.doOperation(resizeRightNeg);
});

var resizeLeftNeg = slate.operation("resize", {
	"width": "-10%",
	"height": "+0",
	"anchor": "bottom-right"
});
slate.bind("right:ctrl;alt", function(win) {
	win.doOperation(resizeLeftNeg);
});


var focusUp = slate.operation("focus", {
	"direction": "up"
});
slate.bind("j:alt;shift", function(win) {
	win.doOperation(focusUp);
});


var focusDown = slate.operation("focus", {
	"direction": "down"
});
slate.bind("k:alt;shift", function(win) {
	win.doOperation(focusDown);
});


var focusRight = slate.operation("focus", {
	"direction": "right"
});
slate.bind("l:alt;shift", function(win) {
	win.doOperation(focusRight);
});


var focusLeft = slate.operation("focus", {
	"direction": "left"
});
slate.bind("h:alt;shift", function(win) {
	win.doOperation(focusLeft);
});


var grid = slate.operation("grid", {
	"grids": {
		"1440x900": {
			"width": 8,
			"height": 6
		}
	},
	padding: 6
});
slate.bind("space:shift", grid);


var hint = slate.operation("hint", {
	"characters": "1234qwerasdf"
});
slate.bind("esc:cmd", hint);


// var switcher = slate.operation("switch");
// slate.bind("tab:cmd", switcher);


var relaunch = slate.operation("relaunch");
slate.bind("q:ctrl;alt;cmd", relaunch);






//layouts

// programming layout
// var moveTopRight3of5 = slate.operation("move", {
// 	"x": "screenOriginX + screenSizeX/2 + 35/2",
// 	"y": "screenOriginY + 35",
// 	"width": "screenSizeX/2 - 20 - 35/2",
// 	"height": "screenSizeY/5*3 - 35 - 35/4"
// });
var moveTopRight3of5 = slate.operation("move", {
	"x": "screenOriginX + screenSizeX/2",
	"y": "screenOriginY",
	"width": "screenSizeX/2",
	"height": "screenSizeY/5*3"
});
// var moveBottomRight2of5 = slate.operation("move", {
// 	"x": "screenOriginX + screenSizeX/2 + 35/2",
// 	"y": "screenOriginY + screenSizeY/5*3 + 35/4",
// 	"width": "screenSizeX/2 - 20 - 35/2",
// 	"height": "screenSizeY/5*2 - 20 - 35/4"
// });
var moveBottomRight2of5 = slate.operation("move", {
	"x": "screenOriginX + screenSizeX/2",
	"y": "screenOriginY + screenSizeY/5*3",
	"width": "screenSizeX/2",
	"height": "screenSizeY/5*2 + 20"
});
var programmingLayout = slate.layout("programming", {
	"Sublime Text": {
		"operations": [moveLeft],
		"ignore-fail": true
	},
	"Safari": {
		// "operations": [moveTopRight3of5],
		"operations": [moveTopRight],
		"ignore-fail": true
	},
	"iTerm2": {
		// "operations": [moveBottomRight2of5],
		"operations": [moveBottomRight],
		"ignore-fail": true
	}
});
var hideProgramming = slate.operation("hide", {
	"app": "all-but:['Sublime Text', 'Safari', 'iTerm2']"
});
var showProgramming = slate.operation("show", {
	"app": ["Sublime Text", "Safari", "iTerm2"]
});
var programming = slate.operation("layout", {
	"name": programmingLayout
});
var focusSublime = slate.operation("focus", {
	"app": "Sublime Text"
});
slate.bind("1:ctrl", function() {
	hideProgramming.run();
	showProgramming.run();
	programming.run();
	focusSublime.run();
});