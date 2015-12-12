(function () {
	var canvas = {
		ctx: $("#myCanvas").get(0).getContext("2d"),

		fillPixel: function fillPixel(x, y, colour) {
			ctx.fillStyle = "#FF0000";
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

	canvas.drawGrad();
}) ()
