package Model;

/**
 *
 * @author lala
 */
public class PostIntersectCell extends Cell{

    public PostIntersectCell() {
        this.currentStatus = Status.FREE;
    }

    
    @Override
    public void determineNextStatus() {
        IntersectCell intersection = (IntersectCell) this.neighbours.get(0);
        
        if((intersection.currentGoesVertical && this.sense == RoadSense.Vertical) ||
                (this.sense == RoadSense.Horizontal && !intersection.currentGoesVertical))
            if(intersection.currentStatus == Status.BUSY)
                this.nextStatus = Status.BUSY;
            else
                this.nextStatus = Status.FREE;
        else
            this.nextStatus = Status.FREE;
        
    }

    @Override
    public String toString() {
        return "PostIntersectCell{" + "currentStatus"+this.currentStatus+ '}';
    }
    
    
}
