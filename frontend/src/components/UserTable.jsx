import { useEffect, useState } from 'react';
import api from '../services/api';
import { Table, TableHead, TableBody, TableRow, TableCell, Paper } from '@mui/material';

export default function UserTable() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    api.get('/users').then(res => setUsers(res.data));
  }, []);

  return (
    <Paper sx={{ p: 2 }}>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>Nombre</TableCell>
            <TableCell>Correo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.map((u) => (
            <TableRow key={u.id}>
              <TableCell>{u.nombre}</TableCell>
              <TableCell>{u.correo}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Paper>
  );
}
