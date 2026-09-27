-- HunarGuru Database Schema
CREATE DATABASE IF NOT EXISTS hunarguru;

USE hunarguru;

CREATE TABLE IF NOT EXISTS skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) DEFAULT '',
    target_hours INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS learning_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skill_id INT NOT NULL,
    hours DECIMAL(4,1) NOT NULL,
    notes TEXT,
    log_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

-- Seed data for DevSecOps, Cloud & Backend Tracking
INSERT INTO skills (name, category, target_hours) VALUES
    ('Docker & Containers', 'DevOps', 40),
    ('Kubernetes & Kind', 'DevOps', 60),
    ('Terraform IaC', 'Cloud', 35),
    ('ArgoCD GitOps', 'DevOps', 30),
    ('Trivy & DevSecOps', 'Security', 25),
    ('Go Backend', 'Programming', 50);

INSERT INTO learning_logs (skill_id, hours, notes, log_date) VALUES
    (1, 2.5, 'Built optimized multi-stage distroless Dockerfiles', '2026-03-10'),
    (1, 1.5, 'Image size optimization and layer caching techniques', '2026-03-12'),
    (2, 2.0, 'Configured multi-node Kind cluster and network topologies', '2026-03-13'),
    (2, 3.0, 'StatefulSet and PVC storage definitions for databases', '2026-03-15'),
    (3, 2.0, 'Modular AWS VPC and EC2 provisioning using Terraform', '2026-03-18'),
    (4, 1.5, 'GitOps architecture and automated sync policies', '2026-03-20');
