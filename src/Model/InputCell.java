package Model;

/**
 *
 * @author Laura
 */
public class InputCell extends Cell{

    private int numCarsAwaiting = 0;

    public InputCell() {
        this.currentStatus = Status.FREE;
    }

    
    public void addCarToQueue(){
        this.numCarsAwaiting++;
    }
    
    @Override
    public void determineNextStatus() {
        if(this.currentStatus == Status.BUSY){
            if (this.neighbours.get(0).currentStatus == Status.FREE){
                if (numCarsAwaiting == 0 )
                    this.nextStatus = Status.FREE;
                else{
                    this.nextStatus = Status.BUSY;
                    numCarsAwaiting--;
                }
            }else
                this.nextStatus = this.currentStatus;
        }else{
            if (numCarsAwaiting == 0)
                this.nextStatus = this.currentStatus;
            else{
                this.nextStatus = Status.BUSY;
                this.numCarsAwaiting--;
            }
        }
    }

    @Override
    public String toString() {
        return "InputCell{" + "numCarsAwaiting=" + numCarsAwaiting + "currentStatus"+ this.currentStatus+ '}';
    }
    
    
}
