import javax.microedition.midlet.MIDlet;
public class Sample
extends MIDlet
{
	protected void startApp()
	{
		
	}
	protected void pauseApp()
	{
		notifyPaused();
	}
	protected void destroyApp(boolean Unconditional)
	{
		notifyDestroyed();
	}
}
