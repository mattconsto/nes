package co.swft.util.observerpattern;

public interface SubjectInterface {
    public void register(ObserverInterface observer);
    
    public void unregister(ObserverInterface observer);
    
    public void notifyObservers();
    
    public Object getUpdate(ObserverInterface observer);
}
