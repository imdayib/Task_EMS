SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

Database: `task_management_db`

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `recipient` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `notifications` (`id`, `message`, `recipient`, `type`, `date`, `is_read`) VALUES
(1, 'Customer Feedback Survey Analysis has been assigned to you. Please review and start working on it.', 7, 'New Task Assigned', '2024-09-05', 1),
(2, 'test task has been assigned to you. Please review and start working on it', 7, 'New Task Assigned', '0000-00-00', 1),


CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `tasks` (`id`, `title`, `description`, `assigned_to`, `due_date`, `status`, `created_at`) VALUES
(1, 'Task 1', 'Task Description', 7, NULL, 'completed', '2024-08-29 16:47:37'),
(4, 'Monthly Financial Report Preparation', 'Prepare and review the monthly financial report, including profit and loss statements, balance sheets, and cash flow analysis.', 7, '2024-09-01', 'completed', '2024-08-31 10:50:20'),
(5, 'Customer Feedback Survey Analysis', 'Collect and analyze data from the latest customer feedback survey to identify areas for improvement in customer service.', 7, '2024-09-03', 'in_progress', '2024-08-31 10:50:47'),
(6, 'Website Maintenance and Update', 'Perform regular maintenance on the company website, update content, and ensure all security patches are applied.', 7, '2024-09-03', 'pending', '2024-08-31 10:51:12'),



CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','employee') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `users` (`id`, `full_name`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'ismail', 'admin', '$2y$10$TnyR1Y43m1EIWpb0MiwE8Ocm6rj0F2KojE3PobVfQDo9HYlAHY/7O', 'admin', '2024-08-28 07:10:04'),
(2, 'rage.', 'raage', '$2y$10$8xpI.hVCVd/GKUzcYTxLUO7ICSqlxX5GstSv7WoOYfXuYOO/SZAZ2', 'employee', '2024-08-28 07:10:40'),
(7, 'John', 'john', '$2y$10$CiV/f.jO5vIsSi0Fp1Xe7ubWG9v8uKfC.VfzQr/sjb5/gypWNdlBW', 'employee', '2024-08-29 17:11:21'),
(8, 'sadam', 'sadam', '$2y$10$E9Xx8UCsFcw44lfXxiq/5OJtloW381YJnu5lkn6q6uzIPdL5yH3PO', 'employee', '2024-08-29 17:11:34');


ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

COMMIT;
