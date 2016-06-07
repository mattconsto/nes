package co.swft.util.observerpattern;

public interface ObserverInterface {
    public void update();
    
    public void setSubject(SubjectInterface subject);
}
