# Physical Layer

## Data Channel

The data channel has some innate parameters, such as:

- **Channel Capacity**: It's the bitrate, bandwidth, throughput. It is measured usually in bytes or bits per second. This is the total number of transmitted bits per second, including overhead.
- **Bit rate (bps) and Baud (bd)**: Baud its the unit of modulation rate. It indicates the number of state changes of the transmission medium for one second.

### Nyquist Formula

Nyquist gives the upper bound for the bit rate of a transmission system by calculating the bit rate directly from the number of bits in a symbol and the bandwidth of the system:
$$
C = 2 \times B \times \log_2V
$$
 Where $C$ is the maximum capacity in bps, $B$ is the bandwidth in Hz and $V$ is the number of discrete values.

### Shannon Theorem

The Shannon Theorem gives the capacity of a system in the presence of noise:
$$
C = B \times \log_2(1+\text{SNR})
$$
Where $C$ is the capacity in bps, $B$ is the bandwidth in Hz and $\text{SNR}$ is the signal to noise ratio.

### Encoding

The purpose of encoding is to adapt the data to the physical properties of the medium as well as to detect and correct errors. There are Several different ways to encode data:

- **Non-return to Zero (NRZ)**
- **Non-return to Zero Inverted (NRZI)**
- **Bipolar**
- **MLT3**
- **Manchester**
- **Differential Manchester**
- **4B5B**

### Modulation

A carrier signal is analog, modulation is the conversion to analog signal. Analog Modulation can be done using amplitude, frequency or phase.

### Multiplexing

Multiplexing allows us to combine multiple signals over a shared medium. There are 3 main ways to do it:

- **Frequency Division Multiple Access (FDMA)**: Here each channel has its own dedicated frequency band.
- **Time Division Multiple Access (TDMA)**: It allows many different users to share the same frequency channel by dividing the signal into different time slots.
- **Code Division Multiple Access (CDMA)**: This method modulates the signal such that it has a wider band than the signal before.

