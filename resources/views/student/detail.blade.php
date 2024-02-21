<x-app-layout>
<div class="bg-white">
    <table class="table-auto w-full">
        <thead>
        <tr>
            <th class="border px-6 py-4">Time</th>
            <th class="border px-6 py-4">Date</th>
            <th class="border px-6 py-4">NIS</th>
            <th class="border px-6 py-4">NIP</th>
            <th class="border px-6 py-4">Nama Pelanggaran</th>
            <th class="border px-6 py-4">Point</th>

        </tr>
        </thead>
        <tbody>

        @forelse($detail as $item)

            <tr>

                <td class="border px-6 py-4">{{ $item->time }}</td>
                <td class="border px-6 py-4 ">{{ $item->date }}</td>
                <td class="border px-6 py-4">{{ $item->student_nis }}</td>
                <td class="border px-6 py-4">{{ $item->teacher_nip }}</td>
                <td class="border px-6 py-4">{{ $item->name }}</td>
                <td class="border px-6 py-4">{{ $item->point }}</td>

            </tr>
        @empty
            <tr>
                <td colspan="6" class="border text-center p-5">
                    Data Tidak Ditemukan
                </td>
            </tr>
        @endforelse
        @php
            $totalPoints = $detail->sum('point');
        @endphp
        <tr>
            <td class="border px-6 py-4" colspan="5">Total Points</td>
            <td class="border px-6 py-4">{{ $totalPoints }}</td>
        </tr>
        </tbody>
    </table>
</div>
</x-app-layout>
