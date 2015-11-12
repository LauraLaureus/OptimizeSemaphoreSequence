package Model;

/**
 *
 * @author lala
 */
public class Simulator {

    private final Road h = new Road(RoadSense.Horizontal);
    private final Road h2 = new Road(RoadSense.Horizontal);
    private final Road v = new Road(RoadSense.Vertical);
    private final Road v2 = new Road(RoadSense.Vertical);

    public Simulator() {
        h.intersectRoads(v, 1, 1);
        h.intersectRoads(v2, 2, 1);
        h2.intersectRoads(v, 1, 2);
        h2.intersectRoads(v2, 2, 2);
    }

    public double simulate(boolean[][] semaphoreHistory) {

        //double countCasrIn = 0d;
        for (int i = 0; i < 7200; i++) {
                h.addCar();
                h2.addCar();
                v.addCar();
                v2.addCar();
                //countCasrIn+=4;
            if (i % 10 == 0) {
                //System.out.println(i/2);
                boolean[] thisTime = semaphoreHistory[i % 10];
                h.sem1NextStatus(thisTime[0]);
                v.sem1NextStatus(!thisTime[0]);

                h.sem2NextStatus(thisTime[1]);
                v2.sem1NextStatus(!thisTime[1]);

                h2.sem1NextStatus(thisTime[2]);
                v.sem2NextStatus(!thisTime[2]);

                h2.sem2NextStatus(thisTime[3]);
                v2.sem2NextStatus(!thisTime[3]);
            }

            h.determineNextStatusAndUpdate();
            h2.determineNextStatusAndUpdate();
            v.determineNextStatusAndUpdate();
            v2.determineNextStatusAndUpdate();
        }

        //5760 = 1440(num cars entered)*4roads
        return (double) ((h.count() + v.count() + h2.count() + v2.count()) / 28800d);

    }
}
