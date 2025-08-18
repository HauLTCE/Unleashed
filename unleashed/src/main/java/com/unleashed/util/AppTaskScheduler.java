package com.unleashed.util;

import com.unleashed.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * A central scheduler to run all recurring background tasks for the application.
 * This component scans for methods annotated with @Scheduled and executes them
 * on a configured schedule.
 */
@Component
public class AppTaskScheduler {

    private static final Logger logger = LoggerFactory.getLogger(AppTaskScheduler.class);

    private final SaleService saleService;
    private final DiscountService discountService;
    private final ProductService productService;

    /**
     * Constructor-based dependency injection. Spring will automatically provide
     * the necessary service beans when creating this scheduler.
     *
     * @param saleService The service responsible for sale-related business logic.
     */
    @Autowired
    public AppTaskScheduler(SaleService saleService,
                            DiscountService discountService,
                            ProductService productService) {
        this.saleService = saleService;
        this.discountService = discountService;
        this.productService = productService;
    }

    /**
     * This method runs at the beginning of every minute, aligned with the server's clock.
     * It uses a cron expression to achieve this precise timing.
     *
     * Cron Expression Breakdown: "0 * * * * *"
     *  - 0:  At the 0th second (i.e., the start of the minute)
     *  - *:  Every minute
     *  - *:  Every hour
     *  - *:  Every day of the month
     *  - *:  Every month
     *  - *:  Every day of the week
     *
     * By default, this uses the server's local time zone.
     */
    @Scheduled(cron = "0 * * * * *")
    public void performMinute_lyTasks() {
        logger.info("Scheduler triggered: Starting background tasks...");
        try {
            // tasks
            saleService.performScheduledStatusUpdates();
            discountService.performScheduledStatusUpdates();
            productService.performScheduledStockUpdates();

        } catch (Exception e) {
            // Catching a broad exception is acceptable here to prevent the scheduler from dying
            logger.error("An unexpected error occurred during a scheduled task.", e);
        }
        logger.info("Scheduler finished: All tasks completed.");
    }

    @Scheduled(cron = "0 0 1 * * *") // Every day at 1:00 AM
    public void performDailyTasks() {
        logger.info("Daily scheduler started: Starting background tasks...");
        try {
            productService.performScheduledAgingUpdate();
        } catch (Exception e) {
            logger.error("An unexpected error occurred during a scheduled task.", e);
        }
        logger.info("Daily scheduler finished: All tasks completed.");
    }



}