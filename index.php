<?php

require_once __DIR__ . '/Services/config.php';

function escape(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function fetchRows(mysqli $conn, string $sql): mysqli_result
{
    $result = $conn->query($sql);

    if (!$result instanceof mysqli_result) {
        error_log('Query database gagal: ' . $conn->error);
        http_response_code(500);
        exit('Data tidak dapat dimuat. Silakan periksa konfigurasi database.');
    }

    return $result;
}

$categories = fetchRows(
    $conn,
    'SELECT id_kategori, nama_kategori FROM kategori ORDER BY id_kategori'
);
$products = fetchRows(
    $conn,
    'SELECT produk.id_produk, produk.nama_produk, produk.harga, produk.stok,
            kategori.nama_kategori
     FROM produk
     LEFT JOIN kategori ON kategori.id_kategori = produk.id_kategori
     ORDER BY produk.id_produk'
);
$customers = fetchRows(
    $conn,
    'SELECT id_pelanggan, nama, email, no_hp, alamat, kota
     FROM pelanggan
     ORDER BY id_pelanggan'
);

$categoryCount = $categories->num_rows;
$productCount = $products->num_rows;
$customerCount = $customers->num_rows;
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Ringkasan data kategori, produk, dan pelanggan toko online.">
    <title>Dashboard Toko Online</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header class="site-header">
        <nav class="navbar container" aria-label="Navigasi utama">
            <a class="brand" href="#beranda">Toko<span>Online</span></a>
        </nav>
    </header>

    <main class="container" id="beranda">
        <section class="hero">
            <p class="eyebrow">Ringkasan database</p>
            <h1>Data Toko Online</h1>
            <p class="hero-copy">Kelola dan tinjau informasi kategori, produk, serta pelanggan dalam satu halaman.</p>
            <div class="summary" aria-label="Jumlah data">
                <div class="summary-card">
                    <span class="summary-number"><?= $categoryCount ?></span>
                    <span class="summary-label">Kategori</span>
                </div>
                <div class="summary-card">
                    <span class="summary-number"><?= $productCount ?></span>
                    <span class="summary-label">Produk</span>
                </div>
                <div class="summary-card">
                    <span class="summary-number"><?= $customerCount ?></span>
                    <span class="summary-label">Pelanggan</span>
                </div>
            </div>
        </section>

        <section class="data-section" id="kategori">
            <div class="section-heading">
                <div>
                    <p class="eyebrow">Data 01</p>
                    <h2>Kategori</h2>
                </div>
                <span class="record-count"><?= $categoryCount ?> data</span>
            </div>
            <div class="table-card">
                <div class="table-scroll">
                    <table>
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nama kategori</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($categoryCount === 0): ?>
                                <tr><td class="empty-state" colspan="2">Belum ada data kategori.</td></tr>
                            <?php else: ?>
                                <?php while ($row = $categories->fetch_assoc()): ?>
                                    <tr>
                                        <td><?= escape((string) $row['id_kategori']) ?></td>
                                        <td class="primary-cell"><?= escape($row['nama_kategori']) ?></td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <section class="data-section" id="produk">
            <div class="section-heading">
                <div>
                    <p class="eyebrow">Data 02</p>
                    <h2>Produk</h2>
                </div>
                <span class="record-count"><?= $productCount ?> data</span>
            </div>
            <div class="table-card">
                <div class="table-scroll">
                    <table>
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nama produk</th>
                                <th scope="col">Kategori</th>
                                <th scope="col">Harga</th>
                                <th scope="col">Stok</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($productCount === 0): ?>
                                <tr><td class="empty-state" colspan="5">Belum ada data produk.</td></tr>
                            <?php else: ?>
                                <?php while ($row = $products->fetch_assoc()): ?>
                                    <tr>
                                        <td><?= escape((string) $row['id_produk']) ?></td>
                                        <td class="primary-cell"><?= escape($row['nama_produk']) ?></td>
                                        <td><?= escape($row['nama_kategori'] ?? 'Tanpa kategori') ?></td>
                                        <td><?= escape($row['harga']) ?></td>
                                        <td><?= escape((string) $row['stok']) ?></td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <section class="data-section" id="pelanggan">
            <div class="section-heading">
                <div>
                    <p class="eyebrow">Data 03</p>
                    <h2>Pelanggan</h2>
                </div>
                <span class="record-count"><?= $customerCount ?> data</span>
            </div>
            <div class="table-card">
                <div class="table-scroll">
                    <table>
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nama</th>
                                <th scope="col">Email</th>
                                <th scope="col">No. HP</th>
                                <th scope="col">Alamat</th>
                                <th scope="col">Kota</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($customerCount === 0): ?>
                                <tr><td class="empty-state" colspan="6">Belum ada data pelanggan.</td></tr>
                            <?php else: ?>
                                <?php while ($row = $customers->fetch_assoc()): ?>
                                    <tr>
                                        <td><?= escape((string) $row['id_pelanggan']) ?></td>
                                        <td class="primary-cell"><?= escape($row['nama']) ?></td>
                                        <td><?= escape($row['email']) ?></td>
                                        <td><?= escape($row['no_hp']) ?></td>
                                        <td><?= escape($row['alamat']) ?></td>
                                        <td><?= escape($row['kota']) ?></td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">Dashboard Toko Online <span>&middot;</span> Data terhubung langsung ke database.</div>
    </footer>
</body>
</html>
