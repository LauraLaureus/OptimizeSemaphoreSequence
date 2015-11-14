package Model;

import java.util.ArrayList;

/**
 *
 * @author Laura
 */
public class IntersectCell extends Cell {

    public ArrayList<Cell> perpendicularNeighbours;
    public boolean currentGoesVertical = false;
    public boolean nextGoesVertical = false;

    public IntersectCell() {
        this.currentStatus = Status.FREE;
        if (this.sense == RoadSense.Vertical) {
            currentGoesVertical = true;
            nextGoesVertical = true;
        } else {
            currentGoesVertical = false;
            nextGoesVertical = false;
        }
    }

    @Override
    public void determineNextStatus() {
        if (this.currentStatus == Status.BUSY) {
            if (!currentGoesVertical) {
                if (neighbours.get(1).currentStatus == Status.BUSY) {
                    this.nextStatus = Status.BUSY;
                    this.nextGoesVertical = false;
                } else {
                    this.nextStatus = Status.FREE;
                    selectNeighbours();
                }
            } else {
                if (perpendicularNeighbours.get(1).currentStatus == Status.BUSY) {
                    this.nextStatus = Status.BUSY;
                    this.nextGoesVertical = true;
                }else{
                    this.nextStatus = Status.FREE;
                    selectNeighbours();
                }
            }
        }
        else{
            ArrayList<Cell> interestingNeighbours = selectNeighbours();
            if(interestingNeighbours.get(0).currentStatus == Status.FREE){
                this.nextStatus = Status.FREE;
            }else{
                this.nextStatus = Status.BUSY;
            }
        }
    }

    private ArrayList<Cell> selectNeighbours() {
        SemaphoreCell horizontalSem = (SemaphoreCell) this.neighbours.get(0);
        ArrayList<Cell> result;
        if (horizontalSem.semStatus == SemaphoreStatus.OPEN) {
            result = this.neighbours;
            this.nextGoesVertical = false;
        } else {
            result = this.perpendicularNeighbours;
            this.nextGoesVertical = true;
        }

        this.nextGoesVertical = result.get(0).sense == RoadSense.Vertical;

        return result;
    }

    @Override
    public void update() {
        super.update();
        currentGoesVertical = nextGoesVertical;
    }

    @Override
    public String toString() {
        return "IntersectCell{" + "currentGoesVertical=" + currentGoesVertical + "currentStatus" + this.currentStatus + '}';
    }

}
