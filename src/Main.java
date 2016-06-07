import java.awt.image.BufferedImage;
import java.io.File;

import co.swft.nes.java.*;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.MenuItem;
import javafx.scene.image.Image;
import javafx.stage.Stage;

/**
 * NES Emulator
 * 
 * @author Matthew Consterdine
 */
public class Main extends Application {
	@FXML private Canvas emulationCanvas;
	
	public static void main(String[] args) {
		/*
		 * CPU:
		 *  MOS Technology 6502
		 *  8bit with 16bit address bus
		 *  little-endian
		 * 
		 * Memory:
		 *  2KiB work RAM
		 *  2KiB video RAM
		 *  256B Object Attribute Memory (Hold sprites)
		 *  28B palette RAM
		 *  
		 *  32KiB program ROM (Expanded by bank switching)
		 *  may up to 16KiB expansion area
		 *  may expanded video memory
		 *  
		 * Video:
		 *  Two layers, background > sprite
		 *  sprites have 2 bits for color. 3 colors + transparency
		 *  ntsc values not rgb values
		 *  up to 64 sprites at a time. either 8x8 or 8x16
		 *  8 sprites per scan line
		 *  
		 * Audio:
		 *  eh can come later
		 *  
		 * Memory mappers:
		 *  complex
		 */
		
        Application.launch(args);
	}

	@Override
	public void start(Stage stage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("/co/swft/nes/ui/emulation.fxml"));
	    
        Scene scene = new Scene(root, 800, 600);
        stage.setTitle("Emulation");
        stage.setScene(scene);
        stage.show();
	}
	
	@FXML protected void fileOpenROM(ActionEvent event) {
		try {
	        NESCartridge game = new NESCartridge(new File("tools/hello/hello.nes"));
	        
	        RicohAPU apu = new RicohAPU();
	        RicohPPU ppu = new RicohPPU(emulationCanvas, game);
	        RicohCPU cpu = new RicohCPU(game, ppu, apu);
	        
	        Thread apuT = new Thread(apu);
	        Thread ppuT = new Thread(ppu);
	        Thread cpuT = new Thread(cpu);
	        
	        System.out.println(game);
	        
	        apuT.start();
	        ppuT.start();
	        cpuT.start();
        } catch (Exception e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
        }
	}
}
