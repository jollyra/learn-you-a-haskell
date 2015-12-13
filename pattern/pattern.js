(function () {
	var canvas = {
		pixelScale: 1,
		ctx: $("#myCanvas").get(0).getContext("2d"),

		fillPixel: function fillPixel(x, y, colour) {
			this.ctx.fillStyle = colour;
			var pc = this.pixelScale;
			this.ctx.fillRect(x * pc, y * pc, pc, pc);
		}
	};

	var map = {
		size: 0,
		stick: [],

		init: function init(size) {
			this.size = size;
			this.stick = []
			for(var i = 0; i < size * size; i++) {
				this.stick.push(0);
			}
		},

		getTile: function getTile(x, y) {
			var tileIdx = y * map.size + x;
			return this.stick[tileIdx];
		},
		
		setTile: function getTile(x, y, val) {
			var tileIdx = y * map.size + x;
			return this.stick[tileIdx] = val;
		}
	}

	function drawPattern (map, canvas) {
		for(var y = 0; y < map.size; y++) {
			for(var x = 0; x < map.size; x++) {
				if ((y * x) % 2 == 0) {
					map.setTile(x, y, 1);
				} else {
					map.setTile(x, y, 0);
				}
			}
		}

		for(var y = 0; y < map.size; y++) {
			for(var x = 0; x < map.size; x++) {
				var val = map.getTile(x,y);
				var colour;
				if (val === 1) {
					colour = "#0066ff";
				} else if (val === 0) {
					colour = "#009900";
				}
				canvas.fillPixel(x, y, colour);
			}
		}
	}

	var viewWidth = $(window).width();
	var pixelScale = 20;
	canvas.pixelScale =pixelScale; 
	map.init(viewWidth / pixelScale);
	drawPattern(map, canvas);
	console.log(map, canvas);
}) ()
