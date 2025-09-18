import * as svc from '../services/reports.service.js';

export async function list(_req, res, next) {
  try {
    const data = await svc.listReports();
    res.json(data);
  } catch (err) { next(err); }
}

export async function create(req, res, next) {
  try {
    const { title } = req.body;
    if (!title || !title.trim()) {
      return res.status(400).json({ error: 'title is required' });
    }
    const created = await svc.createReport(title.trim());
    res.status(201).json(created);
  } catch (err) { next(err); }
}
