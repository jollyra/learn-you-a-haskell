(function () {
	var canvas = {
		ctx: $("#myCanvas").get(0).getContext("2d"),

		fillPixel: function fillPixel(x, y, colour) {
			console.log(arguments);
			this.ctx.fillStyle = colour;
			this.ctx.fillRect(x, y, 1, 1);
		}
	};

	var map = {
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
					colour = "F00000";
				} else if (val ===0) {
					colour = "0000FF";
				}
				canvas.fillPixel(x, y, colour);
			}
		}
	}

	var viewWidth = $(window).width();
	map.init(viewWidth);
	drawPattern(map, canvas);
}) ()
