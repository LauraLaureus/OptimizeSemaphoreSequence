package Model;

/**
 *
 * @author Laura
 */
public class SemaphoreCell extends Cell{

    public SemaphoreStatus semStatus;
    private SemaphoreStatus semNextStatus;

    public SemaphoreCell() {
        this.currentStatus = Status.FREE;
        this.semStatus = SemaphoreStatus.OPEN;
    }
   
    
    
    public void setSemaphoreNextStatus(SemaphoreStatus sem){
        this.semNextStatus = sem;
    }

    @Override
    public void determineNextStatus() {
        if(semStatus  == SemaphoreStatus.CLOSED || semStatus == SemaphoreStatus.OPEN && neighbours.get(1).currentStatus == Status.FREE){
            if (neighbours.get(0).currentStatus == Status.FREE)
                this.nextStatus = this.currentStatus;
            else
                this.nextStatus = Status.BUSY;
            
        }else if (semStatus == SemaphoreStatus.OPEN && neighbours.get(1).currentStatus == Status.FREE){
            if (neighbours.get(0).currentStatus == Status.BUSY)
                this.nextStatus = Status.BUSY;
            else
                this.nextStatus = Status.FREE;
        }else{
            this.nextStatus = Status.BUSY;
        }   
    }

    @Override
    public String toString() {
        return "SemaphoreCell{" + "semStatus=" + semStatus + " currentStatus"+ this.currentStatus+'}';
    }

    @Override
    public void update() {
        super.update();
        this.semStatus = semNextStatus;
    }
    
    
}
