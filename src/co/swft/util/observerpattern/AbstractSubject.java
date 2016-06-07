package co.swft.util.observerpattern;
import java.util.HashSet;

public abstract class AbstractSubject implements SubjectInterface {
    private HashSet<ObserverInterface> observers;
	
    public void register(ObserverInterface observer) {
        observers.add(observer);
    }
    
    public void unregister(ObserverInterface observer) {
    	observers.remove(observer);
    }
    
    public void notifyObservers() {
    	for(ObserverInterface observer : new HashSet<ObserverInterface>(observers)) {
    		observer.update();
    	}
    }
    
    public abstract Object getUpdate(ObserverInterface observer);
}
