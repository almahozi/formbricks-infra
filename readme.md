# Project 3 — Formbricks on GKE
> DevOps portfolio project | Goal: land a DevOps/Cloud job by end of 2026

## What We're Building
Self-hosted [Formbricks](https://formbricks.com) (open-source form/survey platform) deployed on GCP using GitOps, multi-environment promotion, and a production-grade infra stack. The app is the vehicle — the infra is the portfolio.

## Why This Stack
Gaps identified from 7 Saudi/regional DevOps job descriptions:
- **GCP** — appears in 5/7 JDs, zero hands-on so far
- **ArgoCD/GitOps** — appears in 3/7 JDs, most commonly asked gap in interviews
- **Ansible** — appears in 4/7 JDs, not touched yet
- **HashiCorp Vault** — appears in 3/7 JDs, secrets management story missing
- **Multi-environment CI/CD** — implied in most JDs, not demonstrated yet

## App: Formbricks
- Open source (AGPLv3), no custom app code needed
- 3 natural services: **Next.js app + PostgreSQL (pgvector) + Redis**
- Docker images available, active community, production-ready

## Target Stack
| Layer | Tool |
|---|---|
| Cloud | GCP (me-central1 — Riyadh region) |
| Kubernetes | GKE |
| Database | Cloud SQL (PostgreSQL) |
| Container Registry | Artifact Registry |
| IaC | Terraform (GCP provider, modular) |
| GitOps | ArgoCD |
| CI | GitHub Actions |
| Config Management | Ansible |
| Secrets | HashiCorp Vault |
| Observability | Prometheus + Grafana + AlertManager |
| DNS / Ingress | GCP Load Balancer + NGINX Ingress |

## Environments
- `dev` — lightweight, minimal resources, fast feedback
- `staging` — mirrors prod, used for validation before promotion
- `prod` — full resources, monitoring, alerting active

## Repo Structure (planned)
```
.
├── terraform/          # GCP infra — GKE, Cloud SQL, VPC, IAM
│   ├── modules/
│   ├── envs/dev/
│   ├── envs/staging/
│   └── envs/prod/
├── ansible/            # Node config, pre-cluster bootstrap
├── helm/               # Custom Helm chart for Formbricks
├── gitops/             # ArgoCD app manifests per environment
│   ├── dev/
│   ├── staging/
│   └── prod/
├── .github/workflows/  # CI — build, scan, push, update manifests
└── docs/               # Architecture diagram, postmortem, runbooks
```

## CI/CD Flow
```
Code push → GitHub Actions CI
  → Docker build
  → Trivy security scan
  → Push image to Artifact Registry
  → Update image tag in gitops/ manifests
  → ArgoCD detects diff → syncs to target environment
  → Promotion: PR merge dev→staging→prod
```

## Build Phases

### Phase 1 — GCP Foundation (Week 1-2)
- [ ] GCP account setup, billing, quotas
- [ ] Terraform: VPC, subnets, GKE cluster, Cloud SQL, Artifact Registry
- [ ] Ansible: any node-level config needed
- [ ] Formbricks running on dev environment manually first

### Phase 2 — GitOps & Multi-env (Week 3-4)
- [ ] ArgoCD installed on GKE
- [ ] Custom Helm chart for Formbricks
- [ ] ArgoCD apps for dev / staging / prod
- [ ] GitHub Actions CI pipeline (build → scan → push → update manifest)
- [ ] Promotion flow working via PR merge

### Phase 3 — Secrets & Security (Week 5)
- [ ] HashiCorp Vault deployed on GKE
- [ ] Formbricks secrets (DB password, SMTP, etc.) managed via Vault
- [ ] Vault + Kubernetes auth backend wired up
- [ ] OIDC / Workload Identity for GitHub Actions → GCP (no static keys)

### Phase 4 — Observability & Incident Story (Week 6-7)
- [ ] Prometheus + Grafana + AlertManager deployed via Helm
- [ ] Dashboards: GKE cluster health, Formbricks app metrics, Redis, Postgres
- [ ] SLO defined (e.g. 99.5% uptime, p95 response < 500ms)
- [ ] AlertManager rules configured
- [ ] Deliberately break something → detect via alerts → fix → write postmortem

### Phase 5 — Polish & Portfolio (Week 8)
- [ ] Architecture diagram in docs/
- [ ] README tells the full story (why each tool, what problem it solves)
- [ ] Postmortem document written up
- [ ] Cost breakdown (GCP billing) documented
- [ ] GitHub repo public and clean

## Previous Projects (for context)
| Project | Stack | What it covers |
|---|---|---|
| Cachet on AWS | Terraform, Docker, GitHub Actions, EC2, RDS, SSM, OIDC | Single-service deploy, AWS basics, CI/CD push model |
| Gitea on EKS | EKS, Helm, HPA, Trivy, Prometheus, Grafana, AlertManager, IRSA | K8s, Helm, observability, AWS deep dive |
| **Formbricks on GKE** | GCP, GKE, ArgoCD, Vault, Ansible, multi-env | GitOps, multi-cloud, secrets mgmt, multi-environment |

## Target Roles (from JD analysis)
- **Mozn AI** — junior-mid, multi-cloud, Saudi-based → best immediate fit
- **Webook.com** — 3-5 yrs, AWS+GCP, remote-friendly → strong fit post-GCP
- **Riyadh 20k role** — GCP preferred, ArgoCD listed in critical competencies

## Notes
- Daily availability: 1-2 hrs weekdays + more on weekends
- Target: job landed by end of 2026
- Keep app layer untouched — all hours go to infra
- Document everything as you build — the README and postmortem are part of the portfolio