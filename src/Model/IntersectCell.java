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
        ArrayList<Cell> interestingNeighbours = selectNeighbours();
        if (interestingNeighbours.get(0).currentStatus == Status.BUSY) {
            this.nextStatus = Status.BUSY;
        } else {
            this.nextStatus = Status.FREE;
        }

    }

    private ArrayList<Cell> selectNeighbours() {
        SemaphoreCell thisSenseSem = (SemaphoreCell) this.neighbours.get(0);
        ArrayList<Cell> result;
        if (thisSenseSem.semStatus == SemaphoreStatus.OPEN) {
            result = this.neighbours;
        } else {
            result = this.perpendicularNeighbours;
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
