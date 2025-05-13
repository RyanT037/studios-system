# studios-system
This is a mini web app project that uses admin approval to create classes students and teachers
uses composer to create downloadable reports either PDF or EXCEL
<?php
require_once '../includes/config.php';
checkRole(['admin']);

$conn = getDB();

// Get counts for dashboard
$students_count = $conn->query("SELECT COUNT(*) FROM students")->fetch_row()[0];
$teachers_count = $conn->query("SELECT COUNT(*) FROM users WHERE role = 'teacher'")->fetch_row()[0];
$classes_count = $conn->query("SELECT COUNT(*) FROM classes")->fetch_row()[0];

// Recent attendance records
$attendance = [];
$result = $conn->query("SELECT a.date, s.first_name, s.last_name, c.class_name, a.status 
                       FROM attendance a
                       JOIN students s ON a.student_id = s.id
                       JOIN classes c ON a.class_id = c.id
                       ORDER BY a.date DESC LIMIT 5");

while ($row = $result->fetch_assoc()) {
    $attendance[] = $row;
}

$conn->close();
?>


<?php include '../includes/header.php'; ?>

<div class="dashboard">
    <h1>Admin Dashboard</h1>
    
    <div class="stats">
        <div class="stat-card">
            <h3>Students</h3>
            <p><?= $students_count ?></p>
        </div>
        
        <div class="stat-card">
            <h3>Teachers</h3>
            <p><?= $teachers_count ?></p>
        </div>
        
        <div class="stat-card">
            <h3>Classes</h3>
            <p><?= $classes_count ?></p>
        </div>
    </div>
    
    <div class="recent-activity">
        <h2>Recent Attendance</h2>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Student</th>
                    <th>Class</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($attendance as $record): ?>
                <tr>
                    <td><?= date('M j, Y', strtotime($record['date'])) ?></td>
                    <td><?= $record['first_name'] . ' ' . $record['last_name'] ?></td>
                    <td><?= $record['class_name'] ?></td>
                    <td><?= $record['status'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<?php include '../includes/footer.php'; ?>


