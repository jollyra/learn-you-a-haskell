(function () {
	var canvas = {
		ctx: $("#myCanvas").get(0).getContext("2d"),

		fillPixel: function fillPixel(x, y, colour) {
			ctx.fillStyle = "#FF0000";
		},

		fillStick: function fillStick(stick, size) {

		},

		drawGrad: function () {
			var grd = this.ctx.createRadialGradient(75,50,5,90,60,100);
			grd.addColorStop(0,"red");
			grd.addColorStop(1,"white");

			// Fill with gradient
			var viewWidth = $(window).width();
			this.ctx.fillStyle = grd;
			this.ctx.fillRect(0,0,viewWidth,viewWidth);
		}
	};

	var map = {
		init: function init(size) {
			this.stick = []
			for(int i = 0; i < size * size; i++) {
				this.stick.push(0);
			}
		},

		getTile: function getTile(x, y) {
			var tileIdx = y * map.size + x;
			assert.equal(tileIdx < this.stick.tiles.length, true, 'coordinates out of bounds');
			return this.stick.tiles[tileIdx];
		}
	}

	canvas.drawGrad();
}) ()
