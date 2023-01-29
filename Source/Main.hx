package;

import lime.app.Application;
import lime.graphics.RenderContext;

/**
 * The entry point of the application.
 */
class Main extends Application
{
  public function new()
  {
    super();

    trace('Hello World');
  }

  public override function render(context:RenderContext):Void
  {
    switch (context.type)
    {
      case CAIRO:
        var cairo:lime.graphics.CairoRenderContext = context.cairo;

        cairo.setSourceRGB(0.75, 1, 0);
        cairo.paint();

      case CANVAS:
        var ctx:lime.graphics.Canvas2DRenderContext = context.canvas2D;

        ctx.fillStyle = '#BFFF00';
        ctx.fillRect(0, 0, window.width, window.height);

      case DOM:
        var element:lime.graphics.DOMRenderContext = context.dom;

        element.style.backgroundColor = '#BFFF00';

      case FLASH:
        var sprite:lime.graphics.FlashRenderContext = context.flash;

        sprite.graphics.beginFill(0xBFFF00);
        sprite.graphics.drawRect(0, 0, window.width, window.height);

      case OPENGL, OPENGLES, WEBGL:
        var gl:lime.graphics.WebGLRenderContext = context.webgl;

        gl.clearColor(0.75, 1, 0, 1);
        gl.clear(gl.COLOR_BUFFER_BIT);

      default:
    }
  }
}
