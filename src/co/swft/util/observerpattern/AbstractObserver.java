package co.swft.util.observerpattern;

public abstract class AbstractObserver implements ObserverInterface {
    @SuppressWarnings("unused")
    private SubjectInterface subject;
    
    public abstract void update();
    
    public void setSubject(SubjectInterface subject) {
    	this.subject = subject;
    }
}
